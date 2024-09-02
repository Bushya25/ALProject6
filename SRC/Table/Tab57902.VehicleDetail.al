table 57902 VehicleDetail
{
    DataClassification = ToBeClassified;
    // LookupPageId = CardVehicle;
    // DrillDownPageId = CardVehicle;

    fields
    {
        field(1; "Chasis Number"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Registration No"; Code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(21; "Registration Name"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Model"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Fc - Expire Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Insurance Expire Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Pollution Expire Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Permit Expire Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        // field(28;"Insurance  Date";Date){
        //     DataClassification = ToBeClassified;
        // }
        field(28; Period; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Over All Expenses"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
       


    }

    keys
    {
        key(key1; "Registration No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;



    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}