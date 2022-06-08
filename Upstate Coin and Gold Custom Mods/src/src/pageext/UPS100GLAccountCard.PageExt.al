pageextension 50000 "UPS100G/L Account Card" extends "G/L Account Card"
{
    layout
    {
        addafter("SAT Account Code")
        {
            field("Internal ID"; Rec."Internal ID")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}