// tableextension 57904 FixedAssetExt extends "Fixed Asset"
// {
//     fields
//     {
//         field(5010; "Project No"; code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Job;

//         }
//         field(5030; "Project Name"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(5012; Location; code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Location;
//         }
//         field(5013; "Responsible_Employee"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Employee;

//         }
//         field(5014; ProjectAge; Duration)
//         {
//             DataClassification = ToBeClassified;
//         }
//         // field(5015; TotalCost; Decimal)
//         // {
//         //     FieldClass = FlowField;
//         //     CalcFormula = sum(SubTable.Cost where("Fixed Assest No" = field("No.")));
//         // }
//         field(5020; " TotalCost"; Decimal)
//         {
//             FieldClass = FlowField;
//             CalcFormula = sum(SubTable.Cost where("Fixed Assest No" = field("No.")));
//         }
//         field(5016; " Brand"; Code[50])
//         {
//             DataClassification = ToBeClassified;

//             TableRelation = "BrandTable";
//             trigger OnValidate()
//             var
//                 ModelT: Record "ModelTable";
//             begin
//                 if " Brand" <> '' then begin
//                     ModelT.SetRange("BrandCode", " Brand");
//                     " Model" := '';
//                 end;
//             end;


//         }
//         field(5017; " Model"; code[50])
//         {
//             DataClassification = ToBeClassified;

//             TableRelation = "ModelTable".Code WHERE("BrandCode" = FIELD(" Brand")); // Filter Model Table based on selected Brand
//             trigger OnValidate()
//             var
//                 ModelT: Record "ModelTable";
//             begin
//                 if " Brand" <> '' then begin
//                     if ModelT.Get(" Model") then begin
//                         if ModelT."BrandCode" <> " Brand" then
//                             Error('Invalid model for the selected brand');
//                     end;
//                 end;
//             end;
//         }
//         field(5018; StateCode; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             // FieldClass = FlowField;
//             // CalcFormula = lookup(Job."State Code" where("No." = field("Project No")));

//         }
//         field(5019; TMI; Option)
//         {
//             OptionMembers = "","OTDR","SPM","LOCATOR";
//             DataClassification = ToBeClassified;
//         }
//         field(5025;"Line Manager"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         //     field(5010; "Fixed Asset Status"; Option)
//         //     {
//         //         OptionMembers = " ","Under service","Not Assgined","Assgined";
//         //         DataClassification = ToBeClassified;
//         //     }
//         //     field(5011; "Project No"; Code[20])
//         //     {
//         //         DataClassification = ToBeClassified;
//         //         TableRelation = Job;
//         //         trigger OnValidate()
//         //         var
//         //             JobL: Record Job;
//         //             Email: Codeunit "Email";
//         //             EmailMessage: Codeunit "Email Message";
//         //             EmailSetup: Record "Email Account";
//         //             ToAddress: Text;
//         //             Subject: Text;
//         //             Body: Text[1000];
//         //             FA: Record "Fixed Asset";


//         //             Issent: Boolean;
//         //         begin
//         //             if JobL.Get(Rec."Project No") then begin
//         //                 Rec.Description2 := JobL.Description;
//         //                 ToAddress := Rec."E_Mail";
//         //                 Subject := 'Assiged Assets for the Project';
//         //                 Body := 'Fixed Asset Serial Number is' + Rec."Serial No." + '. ' + 'The Project Number is ' + Rec."Project No" + '. And Description :' + Rec.Description2 + '.';
//         //                 EmailMessage.Create(ToAddress, Subject, Body);
//         //                 Issent := Email.Send(EmailMessage);

//         //                 if Issent then
//         //                     Message('Email sented')
//         //                 else
//         //                     Message('Email failed');
//         //             end;
//         //         end;
//         //     }
//         //     field(5012; Description2; Text[200])
//         //     {
//         //         DataClassification = ToBeClassified;
//         //     }
//         //     field(5013; "Person_Responsible_ID"; Text[20])
//         //     {
//         //         DataClassification = ToBeClassified;
//         //         TableRelation = Employee;
//         //         trigger OnValidate()
//         //         var
//         //             Employee: Record Employee;
//         //         begin
//         //             if Employee.Get(Rec."Person_Responsible_ID") then begin
//         //                 Rec."E_Mail" := Employee."E-Mail";
//         //             end;
//         //         end;
//         //     }
//         //     field(5014; "E_Mail"; Text[80])
//         //     {
//         //         DataClassification = ToBeClassified;
//         //         Editable = false;
//         //     }
//         //     field(5015; "From Job No"; Code[20])
//         //     {
//         //         DataClassification = ToBeClassified;
//         //         TableRelation = Job;
//         //     }
//         //     field(5016; "To Job No"; Code[20])
//         //     {
//         //         DataClassification = ToBeClassified;
//         //         TableRelation = Job;
//         //     }
//         //     field(5017; "Assgined_By"; Code[50])
//         //     {
//         //         DataClassification = ToBeClassified;
//         //         TableRelation = Job;
//         //         trigger OnValidate()
//         //         var
//         //             Job: Record Job;
//         //         begin
//         //             Job.Get(Rec."Assgined_By");
//         //             Rec.Person_Responsible_Name := Job."Person Responsible";

//         //         end;
//         //     }
//         //     field(5018; "From_Date_Time"; DateTime)
//         //     {
//         //         DataClassification = ToBeClassified;
//         //         Editable = false;

//         //     }
//         //     field(5019; "To_Date_Time"; DateTime)
//         //     {
//         //         DataClassification = ToBeClassified;
//         //         trigger OnValidate()
//         //         var
//         //             TotalHours: Decimal;
//         //             TotalDays: Decimal;
//         //         begin
//         //             // Calculate total hours and total days between the two DateTime fields
//         //             TotalHours := (Rec."To_Date_Time" - Rec."From_Date_Time") * 24;
//         //             TotalDays := TotalHours / 24;

//         //             // Assuming Rec.Age_ is a Decimal field
//         //             Rec.Age_ := TotalDays; // or TotalHours, depending on your requirement
//         //         end;


//         //     }
//         //     field(5020; Age_; Duration)
//         //     {
//         //         DataClassification = ToBeClassified;

//         //     }
//         //     field(5021; "Person_Responsible_Name"; Code[50])
//         //     {
//         //         DataClassification = ToBeClassified;
//         //     }
//     }

// }


// pageextension 57906 FAList extends "Fixed Asset List"
// {
//     layout
//     {
//         addafter(Description)
//         {
//             field(Location; Rec.Location)
//             {
//                 ApplicationArea = All;
//             }
//             field(ProjectAge; Rec.ProjectAge)
//             {
//                 ApplicationArea = All;
//             }

//         }
//         addafter("FA Location Code")
//         {
//             field(StateCode; Rec.StateCode)
//             {
//                 Caption = 'Circle';
//                 ApplicationArea = all;
//             }
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }