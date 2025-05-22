page 50130 "Example Document List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ExampleHeader;
    Caption = 'Example Document List';
    Editable = false;
    CardPageId = "Example Document";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'This is No..';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Thid is Doument Date.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'This is Posting Date.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                    ToolTip = 'This is No.Printed.';
                }
            }
        }
    }
}