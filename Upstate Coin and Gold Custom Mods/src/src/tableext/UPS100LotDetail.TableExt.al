tableextension 50004 "UPS100 Lot Detail" extends "CAiRef Lot Detail"
{
    fields
    {
        field(50000; "Lot SysId"; Guid)
        {
            TableRelation = "CAiRef Lot".SystemId;
        }
        modify("Gross Weight")
        {
            trigger OnBeforeValidate()
            begin
                CheckHeaderStatus();
            end;
        }
    }

    var
        MyLot: Record "CAiRef Lot";

    local procedure CheckHeaderStatus()
    begin
        GetHeader();
    end;

    local procedure GetHeader()
    begin
        if MyLot.SystemId <> Rec."Lot SysId" then
            MyLot.GetBySystemId(Rec."Lot SysId");
    end;

}