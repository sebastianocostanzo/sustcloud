from cumulusci.tasks.salesforce import BaseSalesforceApiTask


class GetAvailableLicenses(BaseSalesforceApiTask):
    def _run_task(self):
        self.return_values = [
            result["LicenseDefinitionKey"]
            for result in self.sf.query("SELECT LicenseDefinitionKey FROM UserLicense")[
                "records"
            ]
        ]
        licenses = "\n".join(self.return_values)
        self.logger.debug(f"Found licenses:\n{licenses}")


class GetAvailablePermissionSetLicenses(BaseSalesforceApiTask):
    def _run_task(self):
        self.return_values = [
            result["PermissionSetLicenseKey"]
            for result in self.sf.query(
                "SELECT PermissionSetLicenseKey FROM PermissionSetLicense"
            )["records"]
        ]
        licenses = "\n".join(self.return_values)
        self.logger.debug(f"Found permission set licenses:\n{licenses}")
