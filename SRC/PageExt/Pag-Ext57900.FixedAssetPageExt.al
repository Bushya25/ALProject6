// pageextension 57900 FixedAssetPageExt extends "Fixed Asset Card"
// {
//     layout
//     {
//         // modify("Responsible Employee"){
//         //     trigger OnAfterValidate()

//         //     begin
//         //        CurrPage.Update(false);
//         //     end;
//         // }
//         addafter(Description)
//         {
//             field(TMI; Rec.TMI)
//             {
//                 ApplicationArea = all;
//             }
//             field(" Brand"; Rec." Brand")
//             {
//                 Caption = 'Brand';
//                 ApplicationArea = all;
//                 // trigger OnLookup(Var Text: Text):Boolean
//                 // var
//                 //     myInt: Integer;
//                 // begin
//                 //     Page.RunModal(57912);
//                 // end;
//                 // trigger OnLookup(Var Text: Text): Boolean
//                 // var
//                 //     Brand: Record BrandTable;
//                 // begin
//                 //     if PAGE.RunModal(57912) = ACTION::LookupOK then begin
//                 //         Brand.Get(Rec." Brand");
//                 //         Text := Brand.Code;
//                 //         exit(true);
//                 //     end;
//                 // end;

//                 // ed;

//             }
//             field(" Model"; Rec." Model")
//             {
//                 Caption = 'Model';
//                 ApplicationArea = all;
//             }

//         }
//         addafter(General)
//         {
//             part(subpage; ExpenseDetails)
//             {
//                 ApplicationArea = all;
//                 SubPageLink = "Fixed Assest No" = field("No.");
//                 UpdatePropagation = Both;

//             }
//         }
//         addlast(General)
//         {
//             field(TotalCost; Rec." TotalCost")
//             {
//                 ApplicationArea = all;
//                 Editable = false;

//             }
//         }


//         addafter("Responsible Employee")
//         {
//             field(Responsible_Employee; Rec.Responsible_Employee)
//             {
//                 ApplicationArea = All;
//                 trigger OnValidate()
//                 begin

//                     if Rec.Responsible_Employee <> '' then
//                         SendEmailForAllEmp(Rec.Responsible_Employee);
//                 end;
//             }
//             field("Project No"; Rec."Project No")
//             {
//                 Caption = 'Project No.';
//                 ApplicationArea = all;
//                 trigger OnValidate()
//                 var
//                     FAmove: Record "Fixed Asset Movement";
//                     LastFAmove: Record "Fixed Asset Movement";
//                     job: Record job;


//                 begin

//                     if job.Get(Rec."Project No") then begin
//                         Rec."Project Name" := job.Description;
//                         Rec.StateCode := job.StateCode;
//                         Rec."Line Manager" := Job."Person Responsible";

//                         FAmove.Init();
//                         FAmove.Validate("Fixed Asset", Rec."No.");
//                         FAmove.Validate("Assgined By", UserId);
//                         FAmove.Validate("Person Responsible ID", Job."Person Responsible");



//                         LastFAmove.SetRange("Fixed Asset", Rec."No.");
//                         if LastFAmove.FindLast() then begin
//                             FAmove."From Job No." := LastFAmove."To Job No.";
//                             FAmove."From Date Time" := CurrentDateTime;
//                             LastFAmove."To Date Time" := FAmove."From Date Time";
//                             LastFAmove.Age := LastFAmove."To Date Time" - LastFAmove."From Date Time";
//                             FAmove."To Job No." := Rec."Project No";
//                             LastFAmove.Modify();

//                         end else begin
//                             FAmove."From Job No." := '';
//                             FAmove."From Date Time" := CurrentDateTime;
//                             FAmove."To Job No." := Rec."Project No";
//                         end;
//                         FAmove.Validate("E-Mail Triggered", "Send Email"(Job));
//                         FAmove.Insert();
//                         SendEmailForAllEmp(Rec."Responsible Employee");
//                         message('Successfully moved!!!');
//                     end;
//                 end;

//             }
//             field("Project Name"; Rec."Project Name")
//             {
//                 ApplicationArea = all;

//             }
//             field("Line Manager"; Rec."Line Manager")
//             {
//                 ApplicationArea = all;
//                 Visible = false;
//             }
//             field(Location; Rec.Location)
//             {
//                 ApplicationArea = all;
//             }


//         }

//     }

//     Actions
//     {
//         addafter("FA Book Value")
//         {
//             action("FA Report")
//             {
//                 Caption = 'FAReport';
//                 Image = Report;
//                 ApplicationArea = All;
//                 trigger OnAction()
//                 var
//                     Resource: Record Resource;
//                     Email: Codeunit Email;
//                     EmailMessage: Codeunit "Email Message";
//                     instream: InStream;
//                     outstream: OutStream;
//                     blob: Codeunit "Temp Blob";
//                     recref: RecordRef;
//                     Resrc: Record Resource;
//                     Job: Record Job;
//                 begin
//                     Job.Get(Rec."Project No");
//                     Resource.Get(Job."Person Responsible");
//                     Resource.TestField("E_Mail");
//                     recref.GetTable(Rec);
//                     blob.CreateOutStream(outstream);
//                     EmailMessage.Create(Resource."E_Mail", 'Fixed Asset Report', '');
//                     Report.SaveAs(Report::"FAReport", '', ReportFormat::Excel, outstream);
//                     blob.CreateInStream(instream);
//                     Emailmessage.AddAttachment('Fixed Asset Report.xlsx', ' ', instream);
//                     Email.Send(EmailMessage);
//                     Dialog.Message('Email was sent to the responsible person :' + Resource.Name);
//                 end;

//             }
//         }
//         addafter("C&opy Fixed Asset")
//         {
//             action("FA Movement List")
//             {
//                 Caption = 'FA Movement List';
//                 Image = List;
//                 ApplicationArea = All;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 trigger OnAction()
//                 var
//                     FAmove: Record "Fixed Asset Movement";
//                 begin
//                     Famove.SetRange("Fixed Asset", Rec."No.");
//                     Page.Run(57901, FAmove);
//                 end;
//             }
//             action(MonthlyExpense)
//             {
//                 Caption = 'MonthlyExpense';
//                 Image = Report;
//                 ApplicationArea = All;
//                 Promoted = true;
//                 PromotedCategory = process;
//                 trigger OnAction()
//                 begin
//                     Rec.SetRecFilter();
//                     Report.RunModal(57902, true, false, Rec);
//                 end;
//             }
//         }
//     }
//     trigger OnAfterGetRecord()
//     begin
//         b := Rec."Responsible Employee" <> '';
//         // CurrPage.Close();
//         // CurrPage.Run();

//     end;

//     var
//         a: Record "To-do";

//     procedure "Send Email"(Job: Record Job): Boolean
//     var
//         Resource: Record Resource;
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//     //  emp: Record Employee;
//     begin
//         // Emp.Get(Fa."Responsible Employee");
//         // Emp.TestField("E-Mail");
//         Resource.Get(Job."Person Responsible");
//         Resource.TestField("E_Mail");
//         EmailMessage.Create(Resource."E_Mail", 'Hello', '');
//         Exit(Email.Send(EmailMessage));
//     end;


//     local procedure SendEmailForAllEmp(RE: Code[20])
//     var
//         Emp: Record Employee;
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//     begin

//         Emp.Get(RE);
//         Emp.TestField("E-Mail");
//         EmailMessage.Create(Emp."E-Mail", 'Hai:)', '');
//         Email.Send(EmailMessage);
//     end;

//     var
//         b: Boolean;

// }
// tableextension 57906 Resouce extends Resource
// {
//     fields
//     {
//         field(5010; "E_Mail"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//     }
// }

// pageextension 57907 ResourceP extends "Resource Card"
// {
//     layout
//     {
//         addlast("Personal Data")
//         {
//             field("E_Mail"; Rec."E_Mail")
//             {
//                 ApplicationArea = all;
//             }
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: record 36;
//         a: page 41;
// }
