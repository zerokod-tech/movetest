/*
module std::homework8 {

   use sui::transfer::{Self};
   use sui::object::{Self, ID, UID};
   use sui::tx_context::{Self,TxContext};
   use std::string::{String};
   use sui::event;

// the Asset is a top level resource and contains an child object, Item 
   struct Asset  {
      // add fields
      id: UID,
      item: item
      //i: u8
   }

   // Item is only used as part of an Asset
   struct Item {
      // add fields  : a name, of type String and a value of type u64
      name: String,
      value: u64
   }
   #[test]
   // the entry point to the program 
   public entry fun create_asset {
      // add code to call the create function that will create the Asset, passing in the name and value
      // once the object has been created transfer it to the sender
      //let asset= create();

      let a= create(name, value, ctx);
      transfer::share_object(a);
}

  
 fun create ( name: String, value: u64, ctx: &mut TxContext) : Asset{
      // Add code to create an Asset containing an Item
      // This function should return the Asset

*/
      /*
      Asset:{
         id: ID,
         item: Item(name : 'h8', value: 100)
      }
      */

      /*
      let item = Item(name: name, value: value);
      let id = object: new(ctx);
      event::emit(AssetCreated{id: object::uid_to_inner(&id), name: name, value: value});
      Asset(id:id, item:item)
   }

}
*/

module std::object{

/*
   use sui::transfer::{Self};
   use sui::object::{Self, ID, UID};
   use sui::tx_context::{Self,TxContext};
   use std::string::{String};
   use sui::event;
  */



// the Asset is a top level resource and contains an child object, Item 
   struct Asset has /*key,*/ drop {
      // add fields
      ids: u64,
      item: Item
      //i: u8
   }

   // Item is only used as part of an Asset
   struct Item has drop{
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

 
   fun create ( name: u64, value: u64, _ctx: /*&mut */ u64  ):Asset{
      // Add code to create an Asset containing an Item
      // This function should return the Asset

      /*
      Asset:{
         id: ID,
         item: Item(name : 'h8', value: 100)
      }
      */

    
      let item =  Item { name: name, value: value};
      //let id = object::new(ctx);
      let id = _ctx;
      //event::emit(AssetCreated{id: object::uid_to_inner(&id), name: name, value: value});
      Asset { ids: id, item: item}

      
   }
}
