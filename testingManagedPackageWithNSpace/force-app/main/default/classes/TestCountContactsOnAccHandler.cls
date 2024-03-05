@isTest
public class TestCountContactsOnAccHandler {
    
    @isTest
    static void testCountContacts() {
        // Create test data: Accounts with Contacts
        List<Account> testAccounts = new List<Account>();
        List<Contact> testContacts = new List<Contact>();
        
        for(Integer i = 0; i < 5; i++) {
            Account acc = new Account(Name = 'Test Account ' + i);
            testAccounts.add(acc);
            
            for(Integer j = 0; j < 3; j++) {
                testContacts.add(new Contact(FirstName = 'Contact ' + j, LastName = 'Test ' + i, AccountId = acc.Id));
            }
        }
        insert testAccounts;
        insert testContacts;
        
        // Call the method to be tested
        Test.startTest();
        CountContactsOnAccHandler.countContacts(testContacts);
        Test.stopTest();
        
        // Verify that the NOC__c field on each Account has been updated correctly
        List<Account> updatedAccounts = [SELECT Id, NOC__c FROM Account WHERE Id IN :testAccounts];
        for(Account acc : updatedAccounts) {
            System.assertEquals(acc.Contacts.size(), acc.NOC__c, 'NOC__c field not updated correctly');
        }
    }
}