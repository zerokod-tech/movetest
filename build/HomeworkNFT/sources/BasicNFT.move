module 0x0::BasicNFT {
    use sui::transfer::{Self};
    use sui::object::{Self, ID,UID};
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self, Url};
    use std::string::{Self,String};
    use std::option::{Self,Option};
    use std::vector;


    struct AdminCap has key {
        id : UID,
    }


    struct NFT has key {
        id : UID,
        description : Option<String>,
        url : Url,
    }

     fun init (ctx  : &mut TxContext) {
        let adminCap = AdminCap{ id : object::new(ctx)};
        transfer::transfer(adminCap,tx_context::sender(ctx))
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
        
        let description = if (vector::is_empty(& desc_string)) option::none()
            else {
                let desc = string::utf8(desc_string);
                option::some(desc)

            };
        let url = url::new_unsafe_from_bytes(url_string);
        let new_nft = NFT{id : object::new(ctx), description : description, url : url};

        transfer::transfer(new_nft,address);
    }
     public entry fun get_nft_description(nft :  &NFT ) :  Option<String>{
            nft.description
     }   
     public entry fun get_nft_url(nft :  &NFT ) :  Url{
            nft.url
     }   


    }

     /*
    HOMEWORK
    

    */