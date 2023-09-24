#[allow(unused_use)]
module 0x0::NFT {
    use sui::transfer;
    use sui::object::{Self,UID};
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self, Url};
    use std::string::{Self,String};

const MY_ADDR: address = @0x3eaeddc9bef6bcbdb05f72565d41b4e1f95695f1e6c1380f09a0d9f262280d63;

    struct AdminCap has key {
        id : UID,
    }


    struct NFT has key {
        id : UID,
        description : String,
        url : Url,
    }
   
   struct SimpleNFT has key,store {
        id : UID,
        description : String,
        url : Url,
        previous_owner : address,
    }


     fun init (ctx  : &mut TxContext) {
        let adminCap = AdminCap{ id : object::new(ctx)};
        transfer::transfer(adminCap,MY_ADDR)
        //transfer::transfer(adminCap,tx_context::sender(ctx))
        }

    public entry fun add_additional_admin(_: &AdminCap, new_admin_address: address, ctx: &mut TxContext){
        transfer::transfer(
            AdminCap {
                id: object::new(ctx)
            },
        new_admin_address
        )
    }

    public entry fun mint_nft_to_address(_: &AdminCap, address : address, desc_string : vector<u8>, url_string : vector<u8>, ctx: &mut TxContext) {
        let description = string::utf8(desc_string);
        let url = url::new_unsafe_from_bytes(url_string);
        let new_nft = NFT{id : object::new(ctx), description : description, url : url};

        transfer::transfer(new_nft,address);
    }

    public entry fun mint_simple_to_address(_: &AdminCap, address : address, desc_string : vector<u8>, url_string : vector<u8>, ctx: &mut TxContext) {
        let description = string::utf8(desc_string);
        let url = url::new_unsafe_from_bytes(url_string);
        let previous_owner = tx_context::sender(ctx);
        let new_nft = SimpleNFT{id : object::new(ctx), description : description, url : url,previous_owner : previous_owner};

        transfer::public_transfer(new_nft,address);
    }

    public fun get_previous_owner(nft : &mut SimpleNFT) : &mut address {
        &mut nft.previous_owner
    }

    
    public fun set_previous_owner(nft : &mut SimpleNFT, new_address : address)  {
         nft.previous_owner = new_address
    }

    }

    module 0x0::NFTMarketPlace {
        
        use sui::transfer;
        use sui::tx_context::{Self,TxContext};
        use 0x0::NFT::{Self,SimpleNFT};

        public entry fun moveNFT (nft : SimpleNFT, address : address, ctx: &mut TxContext) {
            let my_address = tx_context::sender(ctx);
            NFT::set_previous_owner(&mut nft,my_address);
            transfer::public_transfer(nft,address);
        }

    }

    /*
    HOMEWORK
    
    
    */