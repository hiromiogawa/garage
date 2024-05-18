import type { MAKER_NAME } from '@prisma/client'

/**
 *
 */
export class MakerEntity {
  /**
   *
   * @param id -データid
   * @param name -自動車メーカー名
   * @param isEnabled -論理削除フラグ
   * @param createdAt -作成日
   * @param updatedAt -更新日
   */
  constructor(
    public readonly id: bigint,
    public name: MAKER_NAME,
    public isEnabled: boolean,
    public readonly createdAt: Date,
    public readonly updatedAt: Date,
  ) {}
}
