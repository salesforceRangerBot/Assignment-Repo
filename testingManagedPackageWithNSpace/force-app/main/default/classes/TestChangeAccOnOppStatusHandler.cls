@isTest
public class TestChangeAccOnOppStatusHandler{
    
    @isTest
    static void testUpdateAccountSingleRecord() {
        // Create a test Account
        Account testAccount = new Account(Name = 'Test Account', Rating = 'Cold');
        insert testAccount;
        
        // Create a test Opportunity related to the test Account
        Opportunity testOpportunity = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Closed Won',
            CloseDate = Date.today(),
            AccountId = testAccount.Id
        );
        insert testOpportunity;
        
        // Call the method to be tested
        Test.startTest();
        ChangeAccOnOppStatusHandler.updateAccount(new List<Opportunity>{testOpportunity});
        Test.stopTest();
        
        // Verify that the rating field on the Account has been updated correctly
        Account updatedAccount = [SELECT Id, Rating FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals('Hot', updatedAccount.Rating, 'Rating field not updated correctly');
    }
}