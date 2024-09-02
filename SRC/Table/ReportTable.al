table 57908 ReportTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;RD;Date)
        {
            DataClassification = ToBeClassified;
            
        }
    }
    
    keys
    {
        key(Key1; RD)
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