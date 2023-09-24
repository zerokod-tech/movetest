module std::homework5 {

        struct Asset has drop {
            // add code here
            flag: u8,
            value: u64
         }

        //add build_asset function

        public fun Create(value : u64, flag : u8) {
           
           //let asset = Asset { flag: flag, value: value };
           Asset {flag: flag, value: value};
        }
        fun Fun_Asset(value : u64, flag : u8) {
            if (value > 100) {
                if (flag == 1 || flag == 0){
                    Create(110,1)
                }else{
                    abort 17
                    //assert
                }
            } 
        }
    }

    /*
    
    [package]
name = 'Homework5'
version = '1.0.0'
[addresses]
basic_address = '0xe836f2836799db6c99bf236064b1047c2e5c7cb30abb34cedc46a2b188c6da30'

[dependencies.AptosFramework]
git = 'https://github.com/aptos-labs/aptos-core.git'
rev = 'mainnet'
subdir = 'aptos-move/framework/aptos-framework'
    
    
    */