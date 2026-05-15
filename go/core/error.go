package core

type CorporateBullshitGeneratorError struct {
	IsCorporateBullshitGeneratorError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewCorporateBullshitGeneratorError(code string, msg string, ctx *Context) *CorporateBullshitGeneratorError {
	return &CorporateBullshitGeneratorError{
		IsCorporateBullshitGeneratorError: true,
		Sdk:              "CorporateBullshitGenerator",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *CorporateBullshitGeneratorError) Error() string {
	return e.Msg
}
