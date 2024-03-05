trigger ChangeAccOnOppStatusTrg on Opportunity (after insert, after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate)
            ChangeAccOnOppStatusHandler.updateAccount(Trigger.new);
    }
}