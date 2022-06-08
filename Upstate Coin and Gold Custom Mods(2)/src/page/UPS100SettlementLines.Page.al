page 50003 "UPS100SettlementLines"
{
    PageType = ListPart;
    DelayedInsert = true;
    PopulateAllFields = true;
    UsageCategory = Lists;
    SourceTable = "CAiRef Settlement Line";
    ODataKeyFields = "Settlement No.", "Line No.";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(settlementNo; Rec."Settlement No.")
                {
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(metalType; Rec."Metal Type")
                {
                    ApplicationArea = All;
                }
                field(grossWeight; Rec."Gross Weight")
                {
                    ApplicationArea = All;
                }
                field(netWeight; Rec."Net Weight")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}