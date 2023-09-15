module std::h6f {


    struct TokenAsset has key {
        value: u64
    }

    
    public entry fun create_Asset(account : &signer) {
        let a = create();
        move_to<TokenAsset>(account,a)

    }


    fun create() : TokenAsset {
        TokenAsset{value:0}
    }

}
