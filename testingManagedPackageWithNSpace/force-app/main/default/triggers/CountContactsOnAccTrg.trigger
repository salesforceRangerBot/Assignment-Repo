trigger CountContactsOnAccTrg on Contact (after insert, after update, after delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isupdate)
            CountContactsOnAccHandler.countContacts(Trigger.new);
        if(Trigger.isDelete)
            CountContactsOnAccHandler.countContacts(Trigger.old);
    }
}