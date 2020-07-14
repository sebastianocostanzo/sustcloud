string userId = UserInfo.getUserId();
string permSetId = [SELECT Id FROM PermissionSet WHERE Name='SustainabilityCloud' LIMIT 1].Id;
List <PermissionSetAssignment> permSetCheck = [SELECT Id FROM PermissionSetAssignment WHERE PermissionSetId = : permSetId AND AssigneeId = : userId];
if (permSetCheck.size() == 0) {
    PermissionSetAssignment psa = new PermissionSetAssignment(PermissionSetId = permSetId, AssigneeId = userId);
    insert psa;
}
