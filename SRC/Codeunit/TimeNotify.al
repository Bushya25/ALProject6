codeunit 57904 NotifyReqToApproval
{
    trigger OnRun()
    begin
        SendEmailToEmployee();
    end;

    local procedure NumberOfRequests(): Integer
    var
        RequestToApprove: Record "Approval Entry";
        LineCon: Integer;
    begin
        LineCon := 0;
        RequestToApprove.SetRange(Status, RequestToApprove.Status::Open);
        if RequestToApprove.FindSet() then
            repeat
                LineCon += 1;
            until RequestToApprove.Next() = 0;
        exit(LineCon);
    end;

    procedure SendEmailToEmployee()
    var
        Comy: Record "Company Information";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        LineCon: Integer;
        ApprovalPageLink: Text;
        HyperLink: Text;
        ApprovalEntry: Record "Approval Entry"; // Record variable for Approval Entry
     
    begin
        Comy.Get();
        Comy.TestField("E-Mail");
        LineCon := NumberOfRequests();
        

        // Get the Tenant ID dynamically instead of hard-coding it
      

        // Build the base URL for Business Central (web client)
        ApprovalPageLink := 'https://businesscentral.dynamics.com/' + TenantId + '/?company=' + CompanyName + '&page=654';

        // Create email content with hyperlink
        HyperLink := 'You have ' + Format(LineCon) + ' pending requests to approve.<br><a href="' + ApprovalPageLink + '">Click this link</a> to view the requests.';

        EmailMessage.Create(Comy."E-Mail", 'Pending Request To Approval', HyperLink, true);
        Email.Send(EmailMessage);
        
        // Optional: Output the generated link for debugging
        Message('Generated URL: %1', ApprovalPageLink);
    end;

    // A helper function to get Tenant ID dynamically
    
}
