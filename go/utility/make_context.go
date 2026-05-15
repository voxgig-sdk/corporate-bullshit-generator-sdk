package utility

import "github.com/voxgig-sdk/corporate-bullshit-generator-sdk/core"

func makeContextUtil(ctxmap map[string]any, basectx *core.Context) *core.Context {
	return core.NewContext(ctxmap, basectx)
}
