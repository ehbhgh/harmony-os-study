function generateRandomString(): string {
  const length = Math.floor(Math.random() * 3) + 7; // 随机生成长度为 7 到 9
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let result = '';
  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    result += characters.charAt(randomIndex)
  }
  return result;
}


export {generateRandomString }