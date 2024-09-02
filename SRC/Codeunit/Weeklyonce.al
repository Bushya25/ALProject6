// codeunit 57904 WeeklyonceEmail
// {
//     trigger OnRun()
//     begin
//         WeeklyonceEmail();
//         REone();
//         RETwo();
//     end;

//     local procedure WeeklyonceEmail()
//     var
//         Resource: Record Resource;
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//         instream: InStream;
//         outstream: OutStream;
//         blob: Codeunit "Temp Blob";
//         recref: RecordRef;
//         Resrc: Record Resource;
//         Job: Record Job;
//         FA: Record "Fixed Asset";
//         Emp: Record Employee;

//     begin
//         if FA.FindSet() then
//             repeat
//                 if Job.Get(FA."Project No") then begin
//                     if Resource.Get(Job."Person Responsible") then begin
//                         Resource.TestField("E_Mail");
//                         blob.CreateOutStream(outstream);
//                         Report.SaveAs(Report::"FA EmailReport", '', ReportFormat::Excel, outstream);
//                         EmailMessage.Create(Resource."E_Mail", 'Fixed Asset Report for Project ', '');
//                         blob.CreateInStream(instream);
//                         EmailMessage.AddAttachment('Fixed Asset Report.xlsx', 'Fixed Asset Report', instream);
//                         Email.Send(EmailMessage);
//                     end;
//                 end;
//             until FA.Next() = 0;
//     end;

//     local procedure REone()
//     var
//         Resource: Record Resource;
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//         instream: InStream;
//         outstream: OutStream;
//         blob: Codeunit "Temp Blob";
//         recref: RecordRef;
//         Resrc: Record Resource;
//         Job: Record Job;
//         FA: Record "Fixed Asset";
//         Emp: Record Employee;

//     begin
//         if FA.FindSet() then
//             repeat

//                 if Emp.Get(FA."Responsible Employee") then begin
//                     Emp.TestField("E-Mail");
//                     blob.CreateOutStream(outstream);
//                     Report.SaveAs(Report::"FA EmailReport", '', ReportFormat::Excel, outstream);

//                     EmailMessage.Create(Emp."E-Mail", 'Fixed Asset Report for Responsible Employee', '');
//                     blob.CreateInStream(instream);
//                     EmailMessage.AddAttachment('Fixed Asset Report.xlsx', 'Fixed Asset Report', instream);
//                     Email.Send(EmailMessage);

//                 end;
//             until FA.Next() = 0;
//     end;

//     local procedure RETwo()
//     var
//         Resource: Record Resource;
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//         instream: InStream;
//         outstream: OutStream;
//         blob: Codeunit "Temp Blob";
//         recref: RecordRef;
//         Resrc: Record Resource;
//         Job: Record Job;
//         FA: Record "Fixed Asset";
//         Emp: Record Employee;

//     begin
//         if FA.FindSet() then
//             repeat

//                 if emp.get(FA.Responsible_Employee) then begin
//                     Emp.TestField("E-Mail");
//                     blob.CreateOutStream(outstream);
//                     Report.SaveAs(Report::"FA EmailReport", '', ReportFormat::Excel, outstream);

//                     EmailMessage.Create(Emp."E-Mail", 'Fixed Asset Report for Responsibe_Employee ', '');
//                     blob.CreateInStream(instream);
//                     EmailMessage.AddAttachment('Fixed Asset Report.xlsx', 'Fixed Asset Report', instream);
//                     Email.Send(EmailMessage);
//                 end;


//             until FA.Next() = 0;
//     end;


// }