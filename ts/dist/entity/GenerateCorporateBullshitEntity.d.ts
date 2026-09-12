import { CorporateBullshitGeneratorEntityBase } from '../CorporateBullshitGeneratorEntityBase';
import type { CorporateBullshitGeneratorSDK } from '../CorporateBullshitGeneratorSDK';
import type { Control } from '../types';
import type { GenerateCorporateBullshit, GenerateCorporateBullshitLoadMatch } from '../CorporateBullshitGeneratorTypes';
declare class GenerateCorporateBullshitEntity extends CorporateBullshitGeneratorEntityBase<GenerateCorporateBullshit> {
    constructor(client: CorporateBullshitGeneratorSDK, entopts: any);
    make(this: GenerateCorporateBullshitEntity): GenerateCorporateBullshitEntity;
    load(this: any, reqmatch?: GenerateCorporateBullshitLoadMatch, ctrl?: Control): Promise<GenerateCorporateBullshitEntity>;
}
export { GenerateCorporateBullshitEntity };
