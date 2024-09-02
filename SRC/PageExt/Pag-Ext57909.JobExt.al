// pageextension 57909 JobExt extends "Job Card"
// {
//     layout
//     {
//         addafter("Project Manager")
//         {
//             field(StateCode; Rec.StateCode)
//             {
//                 ApplicationArea = All;
//             }
//         }

//     }

//     actions
//     {
//         addafter(CompleteProject)
//         {
//             action("Assigned TMI")
//             {
//                 ApplicationArea = all;
//                 Image = FixedAssets;
//                 Promoted = true;
//                 PromotedCategory = process;
//                 tooltip = 'By clicking here you can move to the Fixed Asset List page';
//                 trigger OnAction()
//                 var
//                     FA: Record "Fixed Asset";
//                     FAmove: Record "Fixed Asset Movement";
//                     ProjectAge: Duration;
//                 begin
//                     FAmove.SetRange("To Job No.", Rec."No.");
//                     if FAmove.FindSet() then
//                         repeat
//                             ProjectAge := CurrentDateTime - FAmove."From Date Time";
//                             if FA.Get(FAmove."Fixed Asset") then begin
//                                 FA."ProjectAge" := ProjectAge;
//                                 FA.Modify(true);
//                             end else
//                                 Error('Fixed Asset %1 not found', FAmove."Fixed Asset");
//                         until FAmove.Next() = 0;
//                     // Message('Project Age %1 ', ProjectAge);
//                     Page.Run(Page::"Fixed Asset List");
//                 end;
//             }
//         }
//     }
// }


// tableextension 57907 JobExt extends Job
// {
//     fields
//     {
//         field(57900; "StateCode"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//     }

//     keys
//     {
//         // Add changes to keys here
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;
// }