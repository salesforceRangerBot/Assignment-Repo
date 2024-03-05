public class ChangeAccOnOppStatusHandler {
    public static void updateAccount(List<Opportunity> newOppList){
        Map<Id, Opportunity> oppOnAccIdMap = new Map<Id, Opportunity>();
        for(Opportunity oppAcc : newOppList){
            oppOnAccIdMap.put(oppAcc.AccountId, oppAcc);
        }
        List<Account> accListToUpdate = new List<Account>();
        for(Account accObj :[Select id,rating from Account where Id IN:oppOnAccIdMap.keySet()]){
            if(oppOnAccIdMap.get(accObj.Id).stagename == 'Closed Won'){
                accObj.rating = 'Hot';
                accListToUpdate.add(accObj);
            }
        }
        
        if(!accListToUpdate.isEmpty())
            update accListToUpdate;
    }
}