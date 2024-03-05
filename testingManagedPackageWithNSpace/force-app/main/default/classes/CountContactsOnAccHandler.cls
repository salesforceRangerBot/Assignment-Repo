public class CountContactsOnAccHandler {
    
    public static void countContacts(List<Contact> newCntctList){
        Set<Id> accIds = new Set<Id>();
        for(Contact cnt : newCntctList){
            accIds.add(cnt.AccountId);
        }
		List<Account> updateAccount = new List<Account>();
        for(Account a : [SELECT Id, NOC__c, (SELECT Id FROM Contacts) From Account]){
			a.NOC__c = a.Contacts.Size();
            updateAccount.add(a);
        }
		
		if(!updateAccount.isEmpty())
            update updateAccount;
    }

}