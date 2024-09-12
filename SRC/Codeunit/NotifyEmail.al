codeunit 57902 NotifyEmailForReqToApproval
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
        RequestToApprove.SetRange("Entry No.");
        RequestToApprove.SetRange("Status", RequestToApprove."Status"::Open);
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

    begin
        Comy.Get();
        Comy.TestField("E-Mail");
        LineCon := NumberOfRequests();




        ApprovalPageLink := GETURL(CURRENTCLIENTTYPE, CompanyName) + '&page=654';
        HyperLink := 'You have ' + Format(LineCon) + ' pending requests to approve.<a href="' + ApprovalPageLink + '">Click this link</a>  to view the requests.';
        EmailMessage.Create(Comy."E-Mail", 'Pending Request To Approval', HyperLink, true);
        Email.Send(EmailMessage);
    end;

}
