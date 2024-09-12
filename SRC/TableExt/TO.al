tableextension 57912 TO extends "Transfer Header"
{
    fields
    {
        field(5010; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}
pageextension 57908 TO extends "Transfer Order"
{
    layout
    {
        addlast(General)
        {
            field(TransferDate; Rec.TransferDate)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;


}
codeunit 57905 TO
{


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnAfterInvtAdjmt', '', false, false)]
    local procedure OnAfterInvtAdjmt(var TransferHeader: Record "Transfer Header"; var TransferShipmentHeader: Record "Transfer Shipment Header")
    begin
        TransferShipmentHeader.TransferDate := TransferHeader.TransferDate;
        TransferShipmentHeader.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnAfterInsertTransShptLine', '', false, false)]
    local procedure OnAfterInsertTransShptLine(var TransShptLine: Record "Transfer Shipment Line"; TransLine: Record "Transfer Line"; CommitIsSuppressed: Boolean; TransShptHeader: Record "Transfer Shipment Header")
    begin
        TransShptLine.TransferDate := TransLine.TransferDate;
        TransShptLine.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnAfterInsertTransRcptHeader', '', false, false)]
    local procedure OnAfterInsertTransRcptHeader(var TransRcptHeader: Record "Transfer Receipt Header"; var TransHeader: Record "Transfer Header")
    begin
        TransRcptHeader."TransferDate" := TransHeader.TransferDate;
        TransRcptHeader.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnAfterInsertTransRcptLine', '', false, false)]
    local procedure OnAfterInsertTransRcptLine(var TransRcptLine: Record "Transfer Receipt Line"; TransLine: Record "Transfer Line"; CommitIsSuppressed: Boolean; TransferReceiptHeader: Record "Transfer Receipt Header")
    begin
        TransRcptLine.TransferDate := TransLine.TransferDate;
        TransRcptLine.Modify();
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", 'OnAfterCreateItemJnlLine', '', false, false)]
    local procedure OnAfterCreateItemJnlLine(var ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferShipmentHeader: Record "Transfer Shipment Header"; TransferShipmentLine: Record "Transfer Shipment Line")
    begin
        ItemJournalLine.TransferDate := TransferLine.TransferDate;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", 'OnBeforePostItemJournalLine', '', false, false)]
    local procedure OnBeforePostItemJournalLine(var ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferReceiptHeader: Record "Transfer Receipt Header"; TransferReceiptLine: Record "Transfer Receipt Line"; CommitIsSuppressed: Boolean; TransLine: Record "Transfer Line"; PostedWhseRcptHeader: Record "Posted Whse. Receipt Header")
    begin
        ItemJournalLine.TransferDate := TransferLine.TransferDate;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry.TransferDate := ItemJournalLine.TransferDate;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnAfterSetItemLedgerEntryFilters', '', false, false)]
    local procedure OnAfterSetItemLedgerEntryFilters(var ItemLedgEntry: Record "Item Ledger Entry"; TransferLine: Record "Transfer Line")
    begin
        ItemLedgEntry.TransferDate := TransferLine.TransferDate;
        ItemLedgEntry.Modify();
    end;

}
tableextension 57913 TOS extends "Transfer Line"
{
    fields
    {
        field(5010; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}

pageextension 57914 TOS extends "Transfer Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(TransferDate; Rec.TransferDate)
            {
                ApplicationArea = all;
                // editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

    trigger OnAfterGetRecord()
    var
        TransferHeader: Record "Transfer Header";
    begin
        if Rec."Document No." <> '' then begin
            TransferHeader.Get(Rec."Document No.");
            Rec.TransferDate := TransferHeader.TransferDate;
            Rec.Modify();
        end;
    end;
}


tableextension 57915 PTS extends "Transfer Shipment Header"

{
    fields
    {
        field(5010; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}

pageextension 57916 PTS extends "Posted Transfer Shipment"
{
    layout
    {
        addlast(General)
        {
            field(TransferDate; Rec.TransferDate)
            {
                ApplicationArea = ALL;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
tableextension 57920 TSL extends "Transfer Shipment Line"
{
    fields
    {
        field(5010; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}
pageextension 57920 TSL extends "Posted Transfer Shpt. Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(TransferDate; Rec.TransferDate)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
tableextension 57916 TRH extends "Transfer Receipt Header"
{
    fields
    {
        field(5010; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}
pageextension 57917 TRH extends "Posted Transfer Receipt"
{
    layout
    {
        addlast(General)
        {
            field(TransferDate; Rec.TransferDate)
            {
                ApplicationArea = ALL;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}

tableextension 57918 TRL extends "Transfer Receipt Line"
{
    fields
    {
        field(5010; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}
pageextension 57919 TRL extends "Posted Transfer Rcpt. Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(TransferDate; Rec.TransferDate)
            {
                ApplicationArea = ALL;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: codeunit 22;
}

tableextension 57921 ILE extends "Item Ledger Entry"
{
    fields
    {
        field(5010; TransferDate; Date)
        {
            Caption = 'Transfer Date';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
    // trigger OnInsert()
    // var
    //     myInt: Integer;
    // begin
    //     Error('Inserted');
    // end;

    // trigger OnModify()
    // var
    //     myInt: Integer;
    // begin
    //     Error('Modify');
    // end;
}
pageextension 57921 ILE extends "Item Ledger Entries"
{
    layout
    {
        addafter("Entry No.")
        {
            field(TransferDate; Rec.TransferDate)
            {
                ApplicationArea = ALL;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

}

tableextension 57922 IJL extends "Item Journal Line"
{
    fields
    {
        field(5010; TransferDate; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: page "Item Journal";
}