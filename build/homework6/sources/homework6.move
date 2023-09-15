//address 0xe836f2836799db6c99bf236064b1047c2e5c7cb30abb34cedc46a2b188c6da30{
   // module Homework6 {
module std::homework6{

        struct TokenAsset has key, drop{
            // add the key ability
            //add value field
            i: u8
        }

        //Call the function create
        public entry fun call_create_Asset(account : signer, i:u8){

        
            // create a TokenAsset 
            // move the TokenAsset to the account address 
            
            create( &account, 0);
            move_to(&account, TokenAsset { i })
        }

        //Create and return a tokenAsset with value 0
        //create an instance of struct and return the instance 
        fun create(_account : &signer, _i: u8) {
            // return a Token Asset with 0 value                                       
            TokenAsset { i: 0 };
        }
    }
//}