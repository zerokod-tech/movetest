
module std::object1 {


   //use sui::transfer::{Self};
   //use sui::object::{Self, ID, UID};
   
   //use sui::tx_context::{Self,TxContext};

   //use std::string::{String};
   //use sui::event;
  

// the Asset is a top level resource and contains an child object, Item 
   struct Asset has key, drop /*key,*/  {
      // add fields
      //id: object::new(ctx),
      //id: UID,
      
      id: u64,
      item: Item
   }

   // Item is only used as part of an Asset
   struct Item has store, drop{
      // add fields  : a name, of type String and a value of type u64
      name: u64,
      value: u64
   }

   // the entry point to the program 
   public entry fun create_asset() {
      // add code to call the create function that will create the Asset, passing in the name and value
      // once the object has been created transfer it to the sender
      //let asset= create();


      //let a= create(110, 1/*, ctx*/);

      create(110, 1, 005);
      //create(110,1,002);

      //let a= create(name, value, ctx);
      //transfer::share_object(a);
}

 
   fun create ( name: u64, value: u64, _ctx: /*&mut */ u64):Asset{
      // Add code to create an Asset containing an Item
      // This function should return the Asset

      /*
      Asset:{
         id: ID,
         item: Item(name : 'h8', value: 100)
      }
      */
      
      //let sender = tx_context::sender(ctx);
      
      let item = Item { name: name, value: value};
      //let id = object::new(ctx);
      let id = _ctx;
      //event::emit(AssetCreated{id: object::uid_to_inner(&id), name: name, value: value});
      Asset { id: id, item: item}

      
   }

}