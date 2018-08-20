
function main(query) {
    const addNmae = `INSERT INTO t_om_system (id, name, is_global, is_show) VALUES (1, 'stackoverflow', 'http://stackoverflow.com/', 'IND')`;
    query(addNmae, []).then(result => {
        // if (result && result[0]['count(*)'] >= maxReportCount) {
        //   log.error(`report count is ${JSON.stringify(result)}.`);
        //   throw new Error('OC.000004');
        // }
        console.log(result)
      })
    //   .then(() => {
    //     const state = JSON.stringify(moreport.state);
    //     const title = moreport.title.trim();
    //     const id = generateUUID();
    //     const sql = 'insert report_table(id, title, description, preset, reportgroup, chartExist, state, isShow, realtime, user, tag, showType, createtime, modifytime) ' +
    //       'values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), now());';
    //     return query(sql, [id, title, moreport.desc, moreport.preset, moreport.reportgroup,
    //       moreport.chartExist, state, moreport.isShow, moreport.realtime, moreport.user, moreport.tag, moreport.showType]).then(() => {
    //         log.info(`create report success. moreport id is ${id}, moreport title is ${title}`);
    //         res.status(200).send({ resultCode: 'OC.000000', resultData: { id } });
    //       });
    //   })
    //   .catch(err => {
    //     if (err.toString().indexOf('Duplicate') >= 0) {
    //       log.error(`create moreport failed, moreport name is duplicate. err is ${err}`);
    //       res.status(200).send({ resultCode: 'OC.000003', resultData: {} });
    //     } else if (err.message === 'OC.000004') {
    //       log.error(`create moreport failed, err is ${err}. report count reaches the max value 300.`);
    //       res.status(200).send({ resultCode: 'OC.000004', resultData: {} });
    //     } else {
    //       log.error(`create moreport failed, err is ${err}`);
    //       res.status(200).send({ resultCode: 'OC.000001', resultData: {} });
    //     }
    //   });
}

module.exports = main