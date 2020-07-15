string userId = UserInfo.getUserId();
string permSetId = [SELECT Id FROM PermissionSet WHERE Name='SustainabilityAnalytics' LIMIT 1].Id;
PermissionSetAssignment psa;
List <PermissionSetAssignment> permSetCheck = [SELECT Id FROM PermissionSetAssignment WHERE PermissionSetId = : permSetId AND AssigneeId = : userId];
if (permSetCheck.size() == 0) {
    psa = new PermissionSetAssignment(PermissionSetId = permSetId, AssigneeId = userId);
    insert psa;
}

//add also Integration user
string integrationUserId = [select id from User where profile.userlicense.name = 'Analytics Cloud Integration User' and name = 'Integration User'].id;
permSetCheck = [SELECT Id FROM PermissionSetAssignment WHERE PermissionSetId = : permSetId AND AssigneeId = : integrationUserId];
if (permSetCheck.size() == 0) {
    psa = new PermissionSetAssignment(PermissionSetId = permSetId, AssigneeId = integrationUserId);
    insert psa;
}

