export const URL = 'http://172.31.64.34:8081/sdk10098/public/yddfMAS/' //接口地址
/**
 * [commonParams 公用参数]
 * @type {Object}
 */
export let commonParams = {
    curPage: 0,
    pageSize: 5
}
/**
 * [assemblyUrl 拼接地址]
 * @param  {[Object]} params [参数对象]
 * @return {[String]}        [拼接好的url]
 */
export function assemblyUrl(params){
    let url = '';
    for (let key in params) {
        let value = encodeURIComponent(params[key] !== undefined ? params[key] : '');
        url += `&${key}=${value}`;
    }
    return url ? url.substring(1) : '';
}
