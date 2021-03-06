@IsTest
public without sharing class contactHouse_test {
    @isTest
    static void contactInsertTest() {        
        
        // SECTION 1
        Test.startTest();
        
        Contact c = new Contact(LastName='test', MailingStreet='123 Street', MailingCity='City', MailingState='State', MailingPostalCode='ZIP', MailingCountry='Country'); //new contact with address
        insert c; //insert                
        
        list<House__c> houses = new list<House__c>([select Id, Contact__c, Primary__c, Address__c from House__c where Contact__c = :c.Id]); //get all houses related to contact
        System.debug(houses);
        c = [select id, Number_of_Houses__c, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry from Contact where Id = :c.id limit 1]; //get the contact we just inserted        
        System.debug(c);
        
        System.assertEquals(1, houses.Size()); //check that there is 1 house related to the contact
        System.assertEquals(1, c.Number_of_Houses__c); //check that the contact shows that it has 1 house
        
        
        // SECTION 2 (uncomment when section 1 is complete)
        // House__c house2 = new House__c(Name='2', Contact__c=c.Id); //new house
        // insert house2; //insert our second house
        
        // houses = new list<House__c>([select Id, Contact__c, Primary__c, Address__c from House__c where Contact__c = :c.Id]); //refresh the list of houses
        // System.debug(houses);
        // c = [select id, Number_of_Houses__c, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry from Contact where Id = :c.id limit 1]; //refresh the contact
        // System.debug(c);
                
        // System.assertEquals(2, houses.Size()); //check that there are 2 houses related to the contact
        // System.assertEquals(2, c.Number_of_Houses__c); //check that the contact shows that it has 2 houses
        
        // SECTION 3 (uncomment when sections 1 and 2 are complete)
        // delete houses; //delete all of the houses
        
        // houses = new list<House__c>([select Id, Contact__c, Primary__c, Address__c from House__c where Contact__c = :c.Id]); //refresh the list houses
        // System.debug(houses);
        // c = [select id, Number_of_Houses__c, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry from Contact where Id = :c.id limit 1]; //refresh the contact
        // System.debug(c);
        
        // System.assertEquals(0, houses.Size()); //check that there are 2 houses related to the contact
        // System.assertEquals(0, c.Number_of_Houses__c); //check that the contact shows that it has 2 houses
        
        Test.stopTest();
    }
}