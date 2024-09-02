// page 57904 CardVehicle
// {
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = VehicleDetail;
//     RefreshOnActivate = true;
//      SaveValues = true;

//     layout
//     {
//         area(Content)
//         {
//             group(Vehicle)
//             {
//                 field("Registration No"; Rec."Registration No")
//                 {
//                     ApplicationArea = All;
//                     TableRelation = VehicleDetails;
//                     trigger OnValidate()
//                     var
//                         VD: Record VehicleDetails;
//                     begin
//                         if VD.Get(Rec."Registration No") then begin
//                             Rec."Chasis Number" := VD."Chasis Number";
//                             Rec."Registration Name" := VD."Registration Name";
//                             Rec.Model := VD.Model;
//                             Rec."Registration Date" := VD."Registration Date";
//                             Rec."Fc - Expire Date" := VD."Fc - Expire Date";
//                             Rec."Insurance Expire Date" := VD."Insurance Expire Date";
//                             Rec."Permit Expire Date" := VD."Permit Expire Date";
//                             Rec."Pollution Expire Date" := VD."Pollution Expire Date";
//                         end;
//                     end;

//                 }

//                 field("Chasis Number"; Rec."Chasis Number")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Registration Name"; Rec."Registration Name")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Registration Date"; Rec."Registration Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Model; Rec.Model)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Fc - Expire Date"; Rec."Fc - Expire Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Insurance Expire Date"; Rec."Insurance Expire Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Pollution Expire Date"; Rec."Pollution Expire Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Permit Expire Date"; Rec."Permit Expire Date")
//                 {
//                     ApplicationArea = All;
//                 }
              
//             }
//             part(subpage; Subpage)
//             {
//                 SubPageLink = "Vehicle Number" = field("Registration No");
//                 UpdatePropagation = Both;
//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(ActionName)
//             {
//                 ApplicationArea = All;

//                 trigger OnAction()
//                 begin

//                 end;
//             }
//         }
//     }

//         // trigger OnAfterGetRecord()
//         // begin
//         //     Rec."Total Cost":=calculateTotalCost();
//         // end;
// //   local procedure CalculateTotalCost(): Decimal
// //     var
// //         Cost: Record SubTable;
// //         TotalCost: Decimal;
// //     begin
// //         TotalCost := 0;
// //         Cost.SetRange("Vehicle Number", Rec."Registration No");
// //         if Cost.FindSet() then
// //             repeat
// //                 TotalCost += Cost.Cost;
// //             until Cost.Next() = 0;
// //         exit(TotalCost);
// //     end;

// }
