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