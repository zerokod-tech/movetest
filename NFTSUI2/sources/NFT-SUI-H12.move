
module 0x0::BasicNFTH12 {
    use sui::transfer::{Self};
    use sui::object::{Self,UID};
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self, Url};
    use std::string::{Self,String};
    use std::option::{Self,Option};
    use std::vector;

    const MY_ADDR: address = @0x3eaeddc9bef6bcbdb05f72565d41b4e1f95695f1e6c1380f09a0d9f262280d63;

    // add a capability for the admin role
    struct AdminCap has key, store {   
        id : UID
    }

    //add a new field to the NFT to store the previous owner 
    struct NFT has key, store {
    // add the NFT fields
        id : UID,
        description : Option<String>,
        url : Url,

    }

    struct SimpleNFT has key,store {
        id : UID,
        description : Option<String>,
        url : Url,
        previous_owner : address,
    }

    // add a funtion to initialise the program 
    fun init (ctx  : &mut TxContext) {
        let adminCap = AdminCap{ id : object::new(ctx)};
        //transfer::transfer(adminCap,tx_context::sender(ctx))
        transfer::public_transfer(adminCap,MY_ADDR)
    }

    /////////////////////////
    ////////////////////////////

    // add a function to create additional admin addresses
    public entry fun add_additional_admin(_: &AdminCap, new_admin_address: address, ctx: &mut TxContext){
        transfer::transfer(
            AdminCap {
                id: object::new(ctx)
            },
        new_admin_address
        )
    }

    // add a function to mint an NFT and transfer it to an address

    public entry fun mint_nft_to_address(_: &AdminCap, address : address, desc_string : vector<u8>, url_string : vector<u8>, ctx: &mut TxContext) {
        
        let description = if (vector::is_empty(& desc_string)) option::none()
            else {
                let desc = string::utf8(desc_string);
                option::some(desc)

            };
        let _previous_owner = tx_context::sender(ctx);
        let url = url::new_unsafe_from_bytes(url_string);
        let new_nft = NFT{id : object::new(ctx), description : description, url : url };

        transfer::transfer(new_nft,address);
    }


public entry fun mint_simplenft_to_address(_: &AdminCap, address : address, desc_string : vector<u8>, url_string : vector<u8>, _previous_owner: address , ctx: &mut TxContext) {
        
        let description = if (vector::is_empty(& desc_string)) option::none()
            else {
                let desc = string::utf8(desc_string);
                option::some(desc)

            };
        let _previous_owner = tx_context::sender(ctx);
        let url = url::new_unsafe_from_bytes(url_string);
        let new_nft = SimpleNFT{id : object::new(ctx), description : description, url : url, previous_owner: address };

        transfer::transfer(new_nft,address);
    }

    // add getter functions for the NFT fields
    public entry fun get_nft_description(nft :  &NFT ) :  Option<String>{
            nft.description
     }   
    public entry fun get_nft_url(nft :  &NFT ) :  Url{
            nft.url
     } 
     //get the previous owner
    
    public fun get_previous_owner(nft : &mut SimpleNFT) : &mut address {
        &mut nft.previous_owner
    }

    
    public fun set_previous_owner(nft : &mut SimpleNFT, new_address : address)  {
         nft.previous_owner = new_address
    }

    }


module 0x0::NFTMarketPlace {
        
        use sui::transfer::{Self};
        use sui::object::{Self,UID};
        use sui::tx_context::{Self,TxContext};
        use sui::url::{Self, Url};
        use std::string::{Self,String};
        use std::option::{Self,Option};
        use std::vector;
        //use 0x0::NFT::{Self,SimpleNFT};




    //add a new field to the NFT to store the previous owner    
    struct NFT has key, store {
    // add the NFT fields
        id : UID,
        description : Option<String>,
        url : Url,
        price: u64,
        MaxAmount: Option<u64>
    }

    struct SimpleNFT has key,store {
        id : UID,
        description : Option<String>,
        url : Url,
        previous_owner : address,
    }

     struct AdminOwner has key, store{
        id: UID,
        _isAdmin: bool,
        NFTowner : address
    }


    struct PlayerNFT has key{

        id : UID,
        NFTowner : address,
        _score : u64,
        adminOwner : AdminOwner
    }

   
    struct MarketPlace has drop{

        _name : Option<String>,
        _NFTSoldNum: u64,
        _lastNFTSold: u64
    }

     // add a capability for the admin role
    struct AdminCap has key, store {   
        id : UID

    }

     public entry fun mint_PlayerNFT_to_address(_: &AdminCap, address : address, _NFTowner: address, _score:  u64, ctx: &mut TxContext) {
        
        let new_AdminOwner = AdminOwner {id : object::new(ctx), _isAdmin : true,  NFTowner: address};
        let score = 10;
        let new_PlayerNFT = PlayerNFT {id : object::new(ctx), NFTowner: address, _score: score, adminOwner: new_AdminOwner };

        transfer::transfer(new_PlayerNFT,address);
    }


    // add a function to create additional admin addresses
    public entry fun add_additional_admin(_: &AdminCap, new_admin_address: address, ctx: &mut TxContext){
        transfer::transfer(
            AdminCap {
                id: object::new(ctx)
            },
        new_admin_address
        )
    }

    public fun changeMarketPlaceName(name: Option<String>, _ctx: &mut TxContext){

        
        let _user_address = tx_context::sender(_ctx);
       //assert!(isAdmin = false);
       
        //let new_nft = NFT{id : object::new(ctx), description : description, url : url };
        let _new_marketPlace = MarketPlace { _name: name , _NFTSoldNum: 100 , _lastNFTSold:100 };
    }


        public entry fun moveNFT (nft : SimpleNFT, address : address, _ctx: &mut TxContext) {
            //let my_address = tx_context::sender(_ctx);
            //NFT::set_previous_owner(&mut nft,my_address);
            transfer::public_transfer(nft,address);
        }

    }