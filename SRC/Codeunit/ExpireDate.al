// codeunit 57901 EmailNotification
// {
//     trigger OnRun()
//     begin
//         SentEmailNotification();
//     end;

//     local procedure SentEmailNotification()
//     var
//         Rec: Record "Fixed Asset";
//         Email: Codeunit "Email";
//         EmailMessage: Codeunit "Email Message";
//         EmailSetup: Record "Email Account";
//         ToAddress: Text;
//         ToAddress1: Text;
//         Subject: Text;
//         Body: Text[1000]; // Increased size to accommodate all messages
//         IsSent: Boolean;
//         ExpirationNotifications: Text;
//         IsNotificationPending: Boolean;
//     begin
//         ExpirationNotifications := '';
//         IsNotificationPending := false;

//         if Rec.FindSet() then
//             repeat
//                 // Check each expiry field and accumulate notifications
//                 if Rec."Fc - Expire Date" <= CalcDate('<7D>', Today) then begin
//                     ExpirationNotifications += 'Vehicle FC Expire Notification for ' + Rec.Description1;
//                     IsNotificationPending := true;
//                 end;

//                 if Rec."Pollution Expire Date" <= CalcDate('<7D>', Today) then begin
//                     ExpirationNotifications += 'Vehicle Pollution Expire Notification for ' + Rec.Description1;
//                     IsNotificationPending := true;
//                 end;

//                 if Rec."EMI Date" <= CalcDate('<7D>', Today) then begin
//                     ExpirationNotifications += 'Vehicle EMI Expire Notification for ' + Rec.Description1;
//                     IsNotificationPending := true;
//                 end;

//                 if Rec."Insurance Expire Date" <= CalcDate('<7D>', Today) then begin
//                     ExpirationNotifications += 'Vehicle Insurance Expire Notification for ' + Rec.Description1;
//                     IsNotificationPending := true;
//                 end;

//                 if Rec."Permit Expire Date" <= CalcDate('<7D>', Today) then begin
//                     ExpirationNotifications += 'Vehicle Permit Expire Notification for ' + Rec.Description1;
//                     IsNotificationPending := true;
//                 end;
//             until Rec.Next() = 0;

//         if IsNotificationPending then begin
//             ToAddress := '2001018psr@gmail.com';//'anishvarshan.a@gmail.com';
//             // ToAddress1:='2001018psr@gmail.com';
//             Subject := 'Vehicle Expiration Notifications';
//             Body := 'The following vehicle notifications are approaching expiry:' + ExpirationNotifications;

//             EmailMessage.Create(ToAddress, Subject, Body);
//             IsSent := Email.Send(EmailMessage);

//             if IsSent then
//                 Message('Email Sent Successfully')
//             else
//                 Error('Failed to send email');
//         end
//         else
//             Message('No expirations are within the specified period.');
//     end;
// }
