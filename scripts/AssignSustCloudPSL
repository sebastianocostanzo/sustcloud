string userId = UserInfo.getUserId();
string permSetId = [SELECT Id FROM PermissionSetLicense WHERE DeveloperName='sustain_app_SustainabilityCloudPsl' LIMIT 1].Id;
List <PermissionSetAssignment> permSetCheck = [SELECT Id FROM PermissionSetAssignment WHERE PermissionSetId = : permSetId AND AssigneeId = : userId];
if (permSetCheck.size() == 0) {
    PermissionSetLicenseAssign psa = new PermissionSetLicenseAssign(PermissionSetLicenseId = permSetId, AssigneeId = userId);
    insert psa;
}
