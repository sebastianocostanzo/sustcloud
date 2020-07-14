string userId = UserInfo.getUserId();
string permSetId = [SELECT Id FROM PermissionSetLicense WHERE DeveloperName='InsightsBuilderPsl' LIMIT 1].Id;
List <PermissionSetLicenseAssignment> permSetCheck = [SELECT Id FROM PermissionLicenseSetAssignment WHERE PermissionSetId = : permSetId AND AssigneeId = : userId];
if (permSetCheck.size() == 0) {
    PermissionSetLicenseAssign psa = new PermissionSetLicenseAssign(PermissionSetLicenseId = permSetId, AssigneeId = userId);
    insert psa;
}
