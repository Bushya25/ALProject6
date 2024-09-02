// report 57904 "FA EmailReport"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'AR.rdl';

//     dataset
//     {
//         dataitem("Company Information"; "Company Information")
//         {
//             column(Name; Name) { }
//             column(Picture; Picture) { }
//             column(Address; Address) { }
//             column(Phone_No_; "Phone No.") { }
//             column(E_Mail; "E-Mail") { }
//         }
//         dataitem(Resource; Resource)
//         {
//             column(No_; "No.")
//             {

//             }
//             column(ResNo; ResNo) { }
//             column(ResName; ResName) { }

//             dataitem(Job; Job)
//             {
//                 DataItemLink = "Person Responsible" = field("No.");
//                 column(No_1; "No.") { }

//                 column(JobNo; JobNo) { }
//                 column(JobDes; JobDes) { }
//                 dataitem("Fixed Asset"; "Fixed Asset")
//                 {
//                     DataItemLink = "Project No" = field("No.");
//                     column(No_2; "No.") { }
//                     column(LOCATOR_Count; LOCATOR_Count) { }
//                     column(SPM_Count; SPM_Count) { }
//                     column(OTDR_Count; OTDR_Count) { }
//                     column(GrandTotal; GrandTotal) { }
//                     column(TMI; TMI) { }
//                     trigger OnPreDataItem()
//                     var
//                         myInt: Integer;
//                     begin

//                         "Fixed Asset".SetRange("Project No", Job."No.");
//                         if "Fixed Asset".FindSet() then;

//                         LOCATOR_Count := 0;
//                         SPM_Count := 0;
//                         OTDR_Count := 0;
//                         GrandTotal := 0;


//                     end;

//                     trigger OnAfterGetRecord()
//                     var
//                         myInt: Integer;
//                     begin
//                         "Fixed Asset".SetRange("Project No", Job."No.");
//                         if "Fixed Asset".FindSet() then;
//                         repeat
//                             case "Fixed Asset"."TMI" of
//                                 "Fixed Asset"."TMI"::LOCATOR:
//                                     LOCATOR_Count += 1;
//                                 "Fixed Asset"."TMI"::OTDR:
//                                     OTDR_Count += 1;
//                                 "Fixed Asset"."TMI"::SPM:
//                                     SPM_Count += 1;
//                             end;
//                         until Next() = 0;
//                         GrandTotal := LOCATOR_Count + SPM_Count + OTDR_Count;
//                     end;


//                 }
//                 trigger OnPreDataItem()
//                 var
//                     myInt: Integer;
//                 begin
//                     Job.SetRange("Person Responsible", Resource."No.");
//                     if Job.FindSet() then;

//                 end;

//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;
//                 begin

//                     JobNo := Job."No.";
//                     JobDes := Job.Description;
//                 end;


//             }
//             trigger OnPreDataItem()
//             var
//                 myInt: Integer;
//             begin
//                 Resource.FindSet();
//             end;

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 ResNo := Resource."No.";
//                 ResName := Resource.Name;

//             end;
//         }
//     }

//     // 

//     var
//         ResName: Text[100];
//         ResNo: Code[20];
//         JobNo: Code[20];
//         JobDes: Text[100];
//         SPM_Count: Integer;
//         OTDR_Count: Integer;
//         LOCATOR_Count: Integer;

//         GrandTotal: Integer;
// }