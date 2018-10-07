CREATE TABLE [dbo].[Questions] (
    [id]               INT          NOT NULL,
    [question_details] VARCHAR (50) NOT NULL,
    [type]             VARCHAR (50) NOT NULL,
    [marks]            INT          NOT NULL,
    [subject]          VARCHAR (50) NOT NULL,
    [is_selected]      INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

