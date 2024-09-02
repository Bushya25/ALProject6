// tableextension 57904 GenLedge extends "General Ledger Setup"
// {
//     fields
//     {
//         field(50001; "Payment Journal Template"; Code[20])
//         {
//             DataClassification = ToBeClassified;
           
          
//         }
//         field(50002; "Payment Journal Batch"; code[20])
//         {
//             DataClassification = ToBeClassified;
            
            
//         }
//         field(50003; "Payment Journal Bank"; code[20])
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
// pageextension 57904 GenLedger extends "General Ledger Setup"
// {
//     layout
//     {
//         addafter("Shortcut Dimension 8 Code")
//         {
//             field("Payment Journal Template"; Rec."Payment Journal Template")
//             {
//                 ApplicationArea = all;
//             }
//             field("Payment Journal Batch"; Rec."Payment Journal Batch")
//             {
//                 ApplicationArea = all;
//             }
//             field("Payment Journal Bank"; Rec."Payment Journal Bank")
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
//         myInt: record 270;
// }
