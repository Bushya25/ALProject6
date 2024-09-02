// page 57903 ItemVehicle
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = VehicleDetail;
//     // CardPageId = CardVehicle;

//     layout
//     {
//         area(Content)
//         {
//             repeater(Vehicle)
//             {
//                 field("Registration No"; Rec."Registration No")
//                 {
//                     Caption = 'Number';
//                     ApplicationArea = All;

//                 }
//                 field(Model; Rec.Model)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Period; Rec.Period)
//                 {
//                     ApplicationArea = All;
//                 }
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

//     // trigger OnAfterGetRecord()
//     // begin
//     //     // Rec."Over All Expenses" := GetTotalCost(Rec."Registration No");
//     //     Rec.Period := GetLastModifiedDate(Rec."Registration No");
//     // end;

//     // local procedure GetTotalCost(RegistrationNo: Code[20]): Decimal
//     // var
//     //     SubpageRec: Record SubTable;
//     //     TotalCost: Decimal;
//     // begin
//     //     SubpageRec.SetFilter("Vehicle Number", RegistrationNo);
//     //     if SubpageRec.FindSet() then
//     //         repeat
//     //             TotalCost += SubpageRec."Total Cost";
//     //         until SubpageRec.Next() = 0;
//     //     exit(TotalCost);
//     // end;

// //     local procedure GetLastModifiedDate(RegistrationNo: Code[20]): Date
// //     var
// //         SubpageRec: Record SubTable;
// //         LastModifiedDate: Date;
// //     begin
// //         SubpageRec.SetFilter("Vehicle Number", RegistrationNo);
// //         if SubpageRec.FindLast() then
// //             LastModifiedDate := SubpageRec.Period;
// //         exit(LastModifiedDate);
// //     end;
//  }
