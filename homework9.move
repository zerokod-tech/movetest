address 0xe836f2836799db6c99bf236064b1047c2e5c7cb30abb34cedc46a2b188c6da30{
//module 0x0::BasicNFT {
module homework9 {
    /*
    use sui::transfer::{Self};
    use sui::object::{Self, ID,UID};
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self, Url};
    use std::string::{Self,String};
*/
    // add a capability for the admin role

    struct NFT has key, drop {
        // add the NFT fields
        id: u8,
        /// Name for the token
        name: u8,
        /// Description of the token
        description: u8,
        /// URL for the token
        url: u8,
        // TODO: allow custom attributes
    }

    struct MintNFTEvent has copy, drop {
        // The Object ID of the NFT
        object_id: u8,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: u8,
    }


    // add a funtion to initialise the program 
    //Call the function create
        public entry fun call_create_NFT(account : signer, i:u8){

        
            // create a TokenAsset 
            // move the TokenAsset to the account address 
            //NFT {id:i, name:0001, description:0002, url:0003 };
            //mint(NFT.id,NFT.name, NFT.description,NFT.url);
            mint( 0001, 0002, 0003);
        }
    // add a function to create additional admin addresses


    // add a function to mint an NFT and transfer it to an address
/// Create a new devnet_nft

    public entry fun mint(
        /*
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
        */
        name: u8,
        description: u8,
        url: u8
        /*ctx: &mut TxContext*/
    ) {
        
        let nft = DevNetNFT {
            /*
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)

            */

            id: 1,
            name: name,
            description: description,
            url: url

          
        };
        


        /*
        let sender = tx_context::sender(ctx);
        event::emit(MintNFTEvent {
            object_id: object::uid_to_inner(&nft.id),
            creator: sender,
            name: nft.name,
        });
        transfer::public_transfer(nft, sender);
        */
        //NFT {id:i, name:0001, description:0002, url:0003 };


         let sender = tx_context::sender(1);
        event::emit(MintNFTEvent {
            object_id: object::uid_to_inner(&nft.id),
            creator: sender,
            name: nft.name,
        });
        transfer::public_transfer(nft, sender);
/*

        let sender = address;
        MintNFTEvent {
            object_id: 1,
            creator: sender,
            name: name,
        };
        //transfer::public_transfer(nft, sender);
*/
        //NFT {id:1, name: name, description:description, url:url };
    }



/*

    // add getter functions for the NFT fields

    /// Get the NFT's `name`
    public fun name(nft: &DevNetNFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &DevNetNFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &DevNetNFT): &Url {
        &nft.url
    }

    */


}

}