table 57901 "Fixed Asset Movement"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(21; "Fixed Asset"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "From Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "To Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Assgined By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Person Responsible ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(26; "E-Mail Triggered"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "From Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "To Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(29; Age; Duration)
        {
            DataClassification = ToBeClassified;
        }

    }
}