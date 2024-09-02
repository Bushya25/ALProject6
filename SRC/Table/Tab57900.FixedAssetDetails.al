table 57900 FixedAssetDetails
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;EntryNo;Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(2;FixedAsset;code[20]){
                DataClassification=ToBeClassified;
        }
        field(3;"From Job No.";code[20]){
            DataClassification=ToBeClassified;
        }
        field(4;"Assigned By";Code[50]){
            DataClassification=ToBeClassified;
        }
    }
    
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
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