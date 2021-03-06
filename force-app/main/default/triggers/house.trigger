trigger house on House__c (after insert, after update, after delete) {        
    for(House__c h : Trigger.new){ // for each house being updated/inserted/deleted
        if(h.Contact__c != null){ // if the Contact relationship is not null
            Contact c = new Contact(Id=h.Contact__c); // create a new contact object to trigger an update to the related record            
        }
    }    
}