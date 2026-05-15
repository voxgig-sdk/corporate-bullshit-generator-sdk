
import { Context } from './Context'


class CorporateBullshitGeneratorError extends Error {

  isCorporateBullshitGeneratorError = true

  sdk = 'CorporateBullshitGenerator'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  CorporateBullshitGeneratorError
}

