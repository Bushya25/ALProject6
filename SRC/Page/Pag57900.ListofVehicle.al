page 57900 ListofVehicle
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VehicleDetail;
    // CardPageId=VehicleCard;
    
    layout
    {
       area(Content){
        repeater(Vehicle){
            field("Registration No";Rec."Registration No"){
                ApplicationArea = All;
                ToolTip='Specifies the Registration Number of the vehicle';
            }
            field("Chasis Number";Rec."Chasis Number"){
                ApplicationArea = All;
                ToolTip='Specifies the Vehicle Identification Number of the vehicle';
            }
            field("Model";Rec."Model"){
                ApplicationArea = All;
                ToolTip='Specifies the Model of the vehicle';
            }
            field("Insurance Expire Date";Rec."Insurance Expire Date"){
                Caption='Insurance Date';
                ApplicationArea = All;
                ToolTip='Specifies the Insurance Date of the vehicle';
            }
        }
       }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}