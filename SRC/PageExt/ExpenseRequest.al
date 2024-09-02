// pageextension 57901 ER extends ExpensesRequest
// {
//     layout
//     {
//         addbefore("No.")
//         {
//             field("FA No"; Rec."FA No")
//             {
//                 ApplicationArea = all;
//                 TableRelation="Fixed Asset";
//                 trigger OnValidate()
//                 var
//                     FA : Record "Fixed Asset";

//                 begin
//                     FA.Get(Rec."FA No");
//                     Rec.SerialNo := FA."Serial No.";

//                 end;


//             }
          
//             field(SerialNo;Rec.SerialNo){
//                 ApplicationArea = all;
//                 Editable=false;
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
// // pageextension 57904 MyExtension extends "Job Planning Lines"
// // {
// //     layout
// //     {
// //         addafter()
// //     }

// //     actions
// //     {
// //         // Add changes to page actions here
// //     }

// //     var
// //         myInt: Integer;
// // }