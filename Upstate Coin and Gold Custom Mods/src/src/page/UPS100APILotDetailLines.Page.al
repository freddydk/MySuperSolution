page 50001 "UPS100APILotDetailLines"
{
    PageType = ListPart;
    ApplicationArea = All;
    DelayedInsert = true;
    UsageCategory = Lists;
    PopulateAllFields = true;
    SourceTable = "CAiRef Lot Detail";
    AutoSplitKey = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            Repeater(General)
            {
                field(id; Format(Rec.SystemId, 0, 4).ToLower()) { }
                field(LotNo; Rec."Lot No.")
                {
                    ApplicationArea = All;
                }
                field(LineNo; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Lot SysID"; Rec."Lot SysId")
                {
                    ApplicationArea = All;
                }
                field("no"; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(grossWeight; Rec."Gross Weight")
                {
                    ApplicationArea = All;
                }
                field(tareWeight; Rec."Tare Weight")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        myLot: Record "CAiRef Lot";
        myLine: Record "CAiRef Lot Detail";
    begin
        if IsDeepInsert then begin
            MyLot.GetBySystemId(Rec."Lot SysId");
            Rec."Lot No." := MyLot."No.";
            myLine.SetRange("Lot No.", Rec."Lot No.");
            if myLine.FindLast() then
                Rec."Line No." := myLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MyLot: Record "CAiRef Lot";
    begin
        IsDeepInsert := IsNullGuid(Rec."Lot SysId");
        if not IsDeepInsert then begin
            MyLot.GetBySystemId(Rec."Lot SysId");
            Rec."Lot No." := MyLot."No.";
        end;
    end;
}