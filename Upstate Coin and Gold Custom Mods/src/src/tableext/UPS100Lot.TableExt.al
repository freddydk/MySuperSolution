tableextension 50002 "UPS100Lot" extends "CAiRef Lot"
{
    fields
    {
        field(50000; "NetSuite P.O. No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50001; "NetSuite Internal ID No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }


}